//
//  PlatformDependencyContainer.swift
//  Platform
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation
import RacoDomain
import Alamofire

public class PlatformDependencyContainer {

    // MARK: - Submodules
    private let networkModule = NetworkModule()

    public init() {}

    // MARK: - Dependencies
    lazy public var credentialsRepository: CredentialsRepository = self.makeCredentialsDataRepository()

    lazy var authRequests = self.makeAuthRequests()

    private let authParameters = RacoAuthParameters()

    private var authedSessionManager: SessionManager?

    // MARK: - Requests
    private func makeAuthRequests() -> AuthRequests {
        return AuthRequests(authParameters: authParameters)
    }

    private func getAuthSessionManager() -> SessionManager {
        if authedSessionManager == nil {
            guard let accessToken = credentialsRepository.accessToken else {
                assertionFailure("Access token must be present on CredentialsRepository before building the authed SessionManager")
                return SessionManager()
            }
            authedSessionManager = networkModule.makeAuthedSessionManager(accessToken: accessToken)
        }

        return authedSessionManager!
    }

    private func buildAuthedSessionManager(accessToken: String) -> SessionManager {
        if authedSessionManager == nil {
            self.authedSessionManager = networkModule.makeAuthedSessionManager(accessToken: accessToken)
        }

        return authedSessionManager!
    }

    private func makeSubjectRequests() -> SubjectRequests {
        return SubjectRequests(sessionManager: getAuthSessionManager())
    }

    // MARK: - Repositories

    // MARK: Credentials
    private func makeCredentialsDataRepository() -> CredentialsRepository {
        return CredentialsDataRepository(
            keyChainDataSource: makeCredentialsKeyChainDataSource(),
            remoteDataSource: makeCredentialsRemoteDataSource()
        )
    }

    private func makeCredentialsKeyChainDataSource() -> CredentialsKeyChainDataSource {
        return CredentialsKeyChainDataSource()
    }

    private func makeCredentialsRemoteDataSource() -> CredentialsRemoteDataSource {
        return CredentialsRemoteDataSource(authRequests: authRequests)
    }

    // MARK: Subjects

    public lazy var subjectsRepository: SubjectsRepository = self.makeSubjectsDataRepository()

    private func makeSubjectsDataRepository()
        -> SubjectsDataRepository<SubjectsRemoteDataSource, SubjectsCacheDataSource> {
            return SubjectsDataRepository<SubjectsRemoteDataSource, SubjectsCacheDataSource>(
                remoteDataSource: makeSubjectsRemoteDataSource(),
                cacheDataSource: makeSubjectsCacheDataSource()
            )
    }

    private func makeSubjectsRemoteDataSource() -> SubjectsRemoteDataSource {
        return SubjectsRemoteDataSource(subjectRequests: makeSubjectRequests())
    }

    private func makeSubjectsCacheDataSource() -> SubjectsCacheDataSource {
        return SubjectsCacheDataSource()
    }

    public func makeGetAllSubjectsUseCase() -> GetAllSubjectsUseCase {
        return GetAllSubjectsUseCase(subjectsRepository: subjectsRepository)
    }

    // MARK: Subject alerts

    public lazy var subjectAlertsRepository: SubjectAlertsRepository = self.makeSubjectAlertsDataRepository()

    private func makeSubjectAlertsDataRepository()
        -> SubjectAlertsDataRepository<SubjectAlertsRemoteDataSource, SubjectAlertsCacheDataSource> {
            return SubjectAlertsDataRepository(
                remoteDataSource: makeSubjectAlertsRemoteDataSource(),
                cacheDataSource: makeSubjectAlertsCacheDataSource()
            )
    }

    private func makeSubjectAlertsRemoteDataSource() -> SubjectAlertsRemoteDataSource {
        return SubjectAlertsRemoteDataSource(sessionManager: getAuthSessionManager())
    }

    private func makeSubjectAlertsCacheDataSource() -> SubjectAlertsCacheDataSource {
        return SubjectAlertsCacheDataSource()
    }

    public func makeGetAllSubjectsAlertsUseCase() -> GetAllSubjectAlertsUseCase {
        return GetAllSubjectAlertsUseCase(subjectAlertsRepository: subjectAlertsRepository)
    }

    // MARK: Schedule

    public lazy var scheduleRepository: ScheduleRepository = self.makeScheduleRepository()

    private func makeScheduleRepository() -> ScheduleDataRepository<ScheduleRemoteDataSource, ScheduleCacheDataSource> {
        return ScheduleDataRepository(remoteDataSource: makeScheduleRemoteDataSource(), cacheDataSource: makeScheduleCacheDataSource())
    }

    private func makeScheduleRemoteDataSource() -> ScheduleRemoteDataSource {
        return ScheduleRemoteDataSource(sessionManager: getAuthSessionManager())
    }

    private func makeScheduleCacheDataSource() -> ScheduleCacheDataSource {
        return ScheduleCacheDataSource()
    }

    public func makeGetAllSchedulesUseCase() -> GetAllSchedulesUseCase {
        return GetAllSchedulesUseCase(scheduleRepository: scheduleRepository)
    }


}
